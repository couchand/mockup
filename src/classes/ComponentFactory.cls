public with sharing class ComponentFactory
{
	public static final Set<String> componentTypeNames = new Set<String>
	{
		'inputText',
		'outputText'
	};

	public static Component.Apex.OutputPanel createComponent( String componentType )
	{
		Component.Apex.OutputPanel dynamicComponent = new Component.Apex.OutputPanel();

		if( 'inputText' == componentType )
		{
			Component.Apex.InputText text = new Component.Apex.InputText();
			text.value = 'foobar';
			dynamicComponent.childComponents.add( text );
		}
		else if( 'outputText' == componentType )
		{
			Component.Apex.OutputText text = new Component.Apex.OutputText();
			text.value = 'foobar';
			dynamicComponent.childComponents.add( text );
		}

		return dynamicComponent;
	}
}
