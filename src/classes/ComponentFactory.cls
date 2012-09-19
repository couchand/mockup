public with sharing class ComponentFactory
{
	static List<Dummy> dummyData = new List<Dummy>
	{
		new Dummy( 'Jim', 'Captain' ),
		new Dummy( 'Spock', 'First Officer' ),
		new Dummy( 'Bones', 'Doctor' )
	};

	public static final Set<String> componentTypeNames = new Set<String>
	{
		'inputText',
		'outputText',
		'pageBlockTable'
	};

	public static Component.Apex.OutputPanel createComponent( String componentType )
	{
		Component.Apex.OutputPanel dynamicComponent = new Component.Apex.OutputPanel( styleClass = 'dynamicComponent' );

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
		else if( 'pageBlockTable' == componentType )
		{
			Component.Apex.Column nameColumn = new Component.Apex.Column();
			nameColumn.expressions.value = '{!row.name}';
			nameColumn.headerValue = 'Name';
			Component.Apex.Column typeColumn = new Component.Apex.Column();
			typeColumn.expressions.value = '{!row.type}';
			typeColumn.headerValue = 'Type';

			Component.Apex.PageBlockTable table = new Component.Apex.PageBlockTable();
			table.value = dummyData;
			table.var = 'row';
			table.childComponents.add( nameColumn );
			table.childComponents.add( typeColumn );

			Component.Apex.PageBlock pb = new Component.Apex.PageBlock();
			pb.childComponents.add( table );

			dynamicComponent.childComponents.add( pb );
		}

		return dynamicComponent;
	}

	public class Dummy
	{
		public String name { get; set; }
		public String type { get; set; }

		public Dummy( String name, String type )
		{
			this.name = name;
			this.type = type;
		}
	}
}