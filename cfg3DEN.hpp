class Cfg3DEN
{
	class Attributes
	{
		class Default;
		class Title: Default
		{
			class Controls
			{
				class Title;
			};
		};
		class Toolbox: Title
		{
			class Controls
			{
				class Title;
				class Value;
			};
		};
		class Combo: Title
		{
			class Controls
			{
				class Title;
				class Value;
			};
		};
		class Slider: Title
		{
			class Controls
			{
				class Title;
				class Value;
				class Edit;
			};
		};

		#include "Modules\attributes.hpp"
	};
};