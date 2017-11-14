class ExpenseSection < SitePrism::Section
# -- field --
  element :date_field, '#date'
  element :time_field, '#time'
  element :amount_field, '#amount'
  element :description_field, '#description'

# -- button --
  element :create_expense_button, '#expenseButton'
end


class ReportSection < SitePrism::Section
# -- field --
  element :start_date_field, '#start'
  element :end_date_field, '#end'

# -- button --
  element :report_button, '#reportbutton'
end


class ResultsSection < SitePrism::Section
# -- result --
  elements :report_item, '#reportItem'
end


class ExpensesPage < SitePrism::Page
  section :expense_section, ExpenseSection, '#expense'
  section :report_section, ReportSection, '#report'
  section :results_section, ResultsSection, '#results'

  def create_expense(expense)
    expense_section.date_field.set expense['date']
    expense_section.time_field.set expense['time']
    expense_section.amount_field.set expense['amount']
    expense_section.description_field.set expense['description']
    expense_section.create_expense_button.click
  end

  def create_set_of_expenses
    expenses = get_expenses_details

    expenses.each do | expense |
      create_expense(expense)
    end
  end

  def generate_report
    report = get_report_details

    report_section.start_date_field.set report['start_date']
    report_section.end_date_field.set report['end_date']
    report_section.report_button.click
  end

  def get_report_results_subtotal
    sum = 0
    results_section.report_item.each do |item|
      sum += /\d+\.00$/.match(item.text)[0].to_i
    end
    sum
  end
end
