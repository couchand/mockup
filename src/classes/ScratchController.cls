public with sharing class ScratchController
{
	public String selectedComponentType { get; set; }

	public List<SelectOption> getComponentTypes()
	{
		List<SelectOption> componentTypes = new List<SelectOption>();

		return componentTypes;
	}

	public Component.Apex.OutputPanel getDynamicComponent()
	{
		Component.Apex.OutputPanel dynamicComponent = new Component.Apex.OutputPanel();

		return dynamicComponent;
	}
}