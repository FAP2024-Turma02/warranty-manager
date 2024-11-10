require 'rails_helper'

RSpec.describe Invoice, type: :model do
  before do
    @user = User.create(name: 'Orelha', email: 'orelha@example.com', password: 'password', confirmed_at: Time.current)
    
    @invoice = Invoice.new(
      invoice_number: 'INV12345',
      purchase_date: Date.today - 1.days,
      issue_date: Date.today,
      user: @user
    )
    
    pdf_path = Rails.root.join('lib', 'assets', 'invoice.pdf')
    @invoice.pdf.attach(io: File.open(pdf_path), filename: 'invoice.pdf', content_type: 'application/pdf')
  end

  it 'is valid with all attributes' do
    expect(@invoice).to be_valid
  end

  context 'validations' do
    let(:invoice) { Invoice.first }

    it 'is valid with all attributes' do
      expect(invoice).to be_valid
    end

    it 'is invalid without an invoice number' do
      invoice.invoice_number = nil
      expect(invoice).not_to be_valid
      expect(invoice.errors[:invoice_number]).to include("can't be blank")
    end

    it 'is invalid without a purchase date' do
      invoice.purchase_date = nil
      expect(invoice).not_to be_valid
      expect(invoice.errors[:purchase_date]).to include("can't be blank")
    end

    it 'is invalid without an issue date' do
      invoice.issue_date = nil
      expect(invoice).not_to be_valid
      expect(invoice.errors[:issue_date]).to include("can't be blank")
    end

    it 'is invalid without an associated user' do
      invoice.user = nil
      expect(invoice).not_to be_valid
      expect(invoice.errors[:user]).to include("must exist")
    end

    it 'is invalid if the invoice number is not alphanumeric' do
      invoice.invoice_number = '12345!'
      expect(invoice).not_to be_valid
      expect(invoice.errors[:invoice_number]).to include("deve conter apenas letras e números!")
    end
  end

  context 'associations' do
    it 'belongs to a user' do
      invoice = Invoice.reflect_on_association(:user)
      expect(invoice.macro).to eq(:belongs_to)
    end

    it 'has one attached pdf' do
      invoice = Invoice.new
      expect(invoice.respond_to?(:pdf)).to be true
      expect(invoice.pdf).to be_an_instance_of(ActiveStorage::Attached::One)
    end
  end

  context 'PDF file functionality' do
    let(:invoice) { Invoice.first }

    it 'allows attaching a PDF' do
      invoice.pdf.attach(io: File.open(Rails.root.join('lib', 'assets', 'invoice.pdf')), filename: 'invoice.pdf', content_type: 'application/pdf')
      expect(invoice.pdf).to be_attached
    end

    it 'is invalid without an attached PDF' do
      invoice.pdf.detach
      expect(invoice).not_to be_valid
      expect(invoice.errors[:pdf]).to include("can't be blank")
    end
  end
end
