public with sharing class ScratchController
{
	public String selectedComponentType { get; set; }

	public List<SelectOption> getComponentTypes()
	{
		List<SelectOption> componentTypes = new List<SelectOption>();

		for( String componentType : ComponentFactory.componentTypeNames )
		{
			componentTypes.add( new SelectOption( componentType, componentType ) );
		}

		return componentTypes;
	}

	public List<Component.Apex.OutputPanel> currentComponents { get; set; }

	public Component.Apex.OutputPanel getDynamicComponent()
	{
		return ComponentFactory.createComponent( selectedComponentType );
	}

	public void addComponent()
	{
		currentComponents.add( ComponentFactory.createComponent( selectedComponentType ) );
	}
}