public with sharing class ScratchController
{
	private final Set<String> componentTypeNames = new Set<String>
	{
		'inputText',
		'outputText'
	};

	public String selectedComponentType { get; set; }

	public List<SelectOption> getComponentTypes()
	{
		List<SelectOption> componentTypes = new List<SelectOption>();

		for( String componentType : componentTypeNames )
		{
			componentTypes.add( new SelectOption( componentType, componentType ) );
		}

		return componentTypes;
	}

	public Component.Apex.OutputPanel getDynamicComponent()
	{
		Component.Apex.OutputPanel dynamicComponent = new Component.Apex.OutputPanel();

		Component.Apex.OutputText text = new Component.Apex.OutputText();

		text.value = selectedComponentType;

		dynamicComponent.childComponents.add( text );

		return dynamicComponent;
	}
}