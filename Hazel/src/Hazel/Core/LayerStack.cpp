#include "hzpch.h"
#include "Hazel/Core/LayerStack.h"

namespace Hazel
{
	LayerStack::~LayerStack()
	{
		for (Layer* layer : m_Layers)
		{
			layer->OnDetach();
			delete layer;
		}
	}

	void LayerStack::PushLayer(Layer* layer) 
	{
		m_Layers.emplace(m_Layers.begin() + m_LayerInsertIndex, layer);
		m_LayerInsertIndex++;
		layer->OnAttach();
	}

	void LayerStack::PushOverlay(Layer* overlayer) 
	{
		m_Layers.emplace_back(overlayer);
		overlayer->OnAttach();
	}

	void LayerStack::PopLayer(Layer* layer) 
	{
		auto it = std::find(m_Layers.begin(), m_Layers.begin() + m_LayerInsertIndex, layer);
		if (it != m_Layers.begin() + m_LayerInsertIndex)// find it successfully!
		{
			layer->OnDetach();
			m_Layers.erase(it);
			m_LayerInsertIndex--;
		}
	}

	void LayerStack::PopOverlay(Layer* overlayer) 
	{
		auto it = std::find(m_Layers.begin(), m_Layers.begin() + m_LayerInsertIndex, overlayer);
		if (it != m_Layers.end())
		{
			overlayer->OnDetach();
			m_Layers.erase(it);
		}
			
	}


}