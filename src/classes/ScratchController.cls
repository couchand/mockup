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

	public Component.Apex.OutputPanel getDynamicComponent()
	{
		return ComponentFactory.createComponent( selectedComponentType );
	}
}