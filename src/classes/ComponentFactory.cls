public with sharing class ComponentFactory
{
	static List<Dummy> dummyData = new List<Dummy>
	{
		new Dummy( 'Jim', 'Captain' ),
		new Dummy( 'Spock', 'First Officer' ),
		new Dummy( 'Bones', 'Doctor' )
	};

	public static final String INPUT_TEXT = 'inputText';
	public static final String OUTPUT_TEXT = 'outputText';
	public static final String COMMAND_BUTTON = 'commandButton';
	public static final String PAGE_BLOCK_TABLE = 'pageBlockTable';
	public static final String DATA_TABLE = 'dataTable';

	public static final Set<String> componentTypeNames = new Set<String>
	{
		INPUT_TEXT,
		OUTPUT_TEXT,
		COMMAND_BUTTON,
		PAGE_BLOCK_TABLE,
		DATA_TABLE
	};

	public static Component.Apex.OutputPanel createComponent( String componentType )
	{
		Component.Apex.OutputPanel dynamicComponent = new Component.Apex.OutputPanel( styleClass = 'dynamicComponent' );

		if( INPUT_TEXT == componentType )
		{
			Component.Apex.InputText text = new Component.Apex.InputText();
			text.value = 'foobar';
			dynamicComponent.childComponents.add( text );
		}
		else if( OUTPUT_TEXT == componentType )
		{
			Component.Apex.OutputText text = new Component.Apex.OutputText();
			text.value = 'foobar';
			dynamicComponent.childComponents.add( text );
		}
		else if( COMMAND_BUTTON == componentType )
		{
			Component.Apex.CommandButton button = new Component.Apex.CommandButton();
			button.value = 'Click me';
			dynamicComponent.childComponents.add( button );
		}
		else if( DATA_TABLE == componentType )
		{
			Component.Apex.Column nameColumn = new Component.Apex.Column();
			nameColumn.expressions.value = '{!row.name}';
			nameColumn.headerValue = 'Name';
			Component.Apex.Column typeColumn = new Component.Apex.Column();
			typeColumn.expressions.value = '{!row.type}';
			typeColumn.headerValue = 'Type';

			Component.Apex.DataTable table = new Component.Apex.DataTable();
			table.value = dummyData;
			table.var = 'row';
			table.childComponents.add( nameColumn );
			table.childComponents.add( typeColumn );

			Component.Apex.PageBlock pb = new Component.Apex.PageBlock();
			pb.childComponents.add( table );

			dynamicComponent.childComponents.add( pb );
		}
		else if( PAGE_BLOCK_TABLE == componentType )
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