
class ElementsReflex < ApplicationReflex

  def sort
    event.preventDefault()

    elements = JSON.parse(element.dataset[:elements])
    elements.each do |element|
      element_record = Element.find(element['id'])
      element_record.update(position: element['position'])
    end
  end

end
