public with sharing class ComponentFactory
{
	static List<Dummy> dummyData = new List<Dummy>
	{
		new Dummy( 'Jim', 'Captain' ),
		new Dummy( 'Spock', 'First Officer' ),
		new Dummy( 'Bones', 'Doctor' )
	};

	public static final String PAGE_BLOCK = 'pageBlock';
	public static final String PAGE_BLOCK_SECTION = 'pageBlockSection';
	public static final String COMMAND_BUTTON = 'commandButton';
	public static final String PANEL_BAR = 'panelBar';
	public static final String TOOLBAR = 'toolbar';
	public static final String INPUT_TEXT = 'inputText';
	public static final String OUTPUT_TEXT = 'outputText';
	public static final String DATA_TABLE = 'dataTable';
	public static final String PAGE_BLOCK_TABLE = 'pageBlockTable';

	public static final Set<String> componentTypeNames = new Set<String>
	{
		PAGE_BLOCK,
		PAGE_BLOCK_SECTION,
		COMMAND_BUTTON,
		TOOLBAR,
		PANEL_BAR,
		INPUT_TEXT,
		OUTPUT_TEXT,
		DATA_TABLE,
		PAGE_BLOCK_TABLE
	};

	public static Component.Apex.OutputPanel createComponent( String componentType )
	{
		Component.Apex.OutputPanel dynamicComponent = new Component.Apex.OutputPanel( styleClass = 'dynamicComponent' );

		if( PAGE_BLOCK == componentType )
		{
			Component.Apex.PageBlock pb = new Component.Apex.PageBlock();
			pb.title = 'foo';
			dynamicComponent.childComponents.add( pb );
		}
		else if( PAGE_BLOCK_SECTION == componentType )
		{
			Component.Apex.PageBlockSection section = new Component.Apex.PageBlockSection();
			section.title = 'bar';

			Component.Apex.PageBlock pb = new Component.Apex.PageBlock();
			pb.childComponents.add( section );

			dynamicComponent.childComponents.add( pb );
		}
		else if( COMMAND_BUTTON == componentType )
		{
			Component.Apex.CommandButton button = new Component.Apex.CommandButton();
			button.value = 'Click me';
			dynamicComponent.childComponents.add( button );
		}
		else if( PANEL_BAR == componentType )
		{
			Component.Apex.PanelBar bar = new Component.Apex.PanelBar();

			Component.Apex.PanelBarItem item1 = new Component.Apex.PanelBarItem( label = 'Foo' );
			item1.expanded = 'true';
			item1.childComponents.add( new Component.Apex.OutputText( value = 'The quick brown fox jumped over the lazy dog.' ) );
			Component.Apex.PanelBarItem item2 = new Component.Apex.PanelBarItem( label = 'Bar' );
			item2.childComponents.add( new Component.Apex.OutputText( value = 'Lorem ipsum dolor et sin dog.' ) );

			bar.switchType = 'client';
			bar.childComponents.add( item1 );
			bar.childComponents.add( item2 );

			dynamicComponent.childComponents.add( bar );
		}
		else if( TOOLBAR == componentType )
		{
			Component.Apex.Toolbar bar = new Component.Apex.Toolbar();

			bar.childComponents.add( new Component.Apex.OutputText( value = 'foo' ) );
			bar.childComponents.add( new Component.Apex.OutputText( value = 'bar' ) );

			Component.Apex.ToolbarGroup floatRight = new Component.Apex.ToolbarGroup();
			floatRight.location = 'right';

			floatRight.childComponents.add( new Component.Apex.CommandLink( value = 'search' ) );

			bar.childComponents.add( floatRight );

			dynamicComponent.childComponents.add( bar );
		}
		else if( INPUT_TEXT == componentType )
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