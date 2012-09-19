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

	public List<String> currentComponents { get; set; }

	public ScratchController()
	{
		currentComponents = new List<String>();
	}
/*

	public Component.Apex.OutputPanel getDynamicComponent()
	{
		return ComponentFactory.createComponent( selectedComponentType );
	}

	public Component.Apex.OutputPanel getPageContents()
	{
		Component.Apex.OutputPanel output = new Component.Apex.OutputPanel();

		for( String child : currentComponents )
		{
			output.childComponents.add( ComponentFactory.createComponent( child ) );
		}

		return output;
	}
*/
	public void addComponent()
	{
		currentComponents.add( selectedComponentType );
	}
}
