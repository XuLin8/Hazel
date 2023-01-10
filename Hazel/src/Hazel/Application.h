#pragma once

#include "Core.h"
#include "Events/Event.h"

namespace Hazel {
	class HAZEL_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	private:
		bool m_Running = true;
	};

	//To be defined in CLIENT
	Application* CreateApplication();
}


