defmodule AdminToWeb.SearchLive do
  @moduledoc false
  use AdminToWeb, :live_view

  alias AdminTo.Packages

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
       name: "",
       packages: [],
       loading: false
       )

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Find a package</h1>
    <div id="search">

      <form phx-submit="deb-search">
        <input id="search-input" type="text" name="name" value="<%= @name %>"
                placeholder="name of the package" autofocus autocomplete="off"
                <%= if @loading, do: "readonly" %> />
        <button type="submit">
          Search
        </button>
      </form>

      <%= if @loading do %>

      <div class="loader">
        <svg version="1.0" xmlns="http://www.w3.org/2000/svg"
        width="120.4000000pt" height="112.7000000pt" viewBox="0 0 604.000000 567.000000"
        preserveAspectRatio="xMidYMid meet">
          <defs>
            <filter id="iconfilter" primitiveUnits="objectBoundingBox" >
          <feFlood flood-color="rgba(213,245,255, .8)"/>
              <feOffset>
                <animate attributeName="dx" from="0" to="1" dur="2s" repeatCount="indefinite" />
              </feOffset>
              <feComposite operator="in" in2="SourceGraphic" />
              <feComposite operator="over" in2="SourceGraphic" />
            </filter>
          </defs>
          <metadata>
          Created by potrace 1.16, written by Peter Selinger 2001-2019
          </metadata>
          <g transform="translate(0.000000,567.000000) scale(0.100000,-0.100000)"
          fill="#3273dc" stroke="none" id="arrowIcon" filter="url(#iconfilter)">
          <path fill="#3273dc" d="M2630 5599 c-293 -33 -586 -138 -825 -296 -127 -84 -316 -272 -402
          -398 -158 -234 -247 -477 -313 -849 -50 -285 -113 -518 -200 -736 -96 -239
          -159 -354 -365 -660 -282 -421 -335 -518 -335 -615 0 -108 54 -171 186 -214
          153 -51 324 -51 469 -1 32 11 60 18 63 16 2 -3 21 -55 42 -118 111 -331 275
          -599 520 -849 49 -51 89 -93 87 -94 -1 -1 -54 -34 -119 -73 -115 -71 -163
          -114 -193 -172 -77 -149 11 -370 171 -430 53 -19 75 -20 617 -20 608 0 647 3
          753 55 62 30 133 104 169 174 l26 53 24 -49 c51 -101 123 -164 236 -205 l64
          -23 605 0 605 0 57 28 c134 66 209 239 163 377 -24 72 -103 150 -225 225 -52
          32 -97 59 -99 61 -3 2 36 46 86 97 235 241 411 528 513 837 25 74 45 136 45
          137 0 0 41 -13 90 -30 81 -29 101 -31 210 -31 199 0 357 57 411 149 23 40 26
          54 23 118 -4 70 -6 76 -84 202 -43 72 -138 218 -210 325 -216 323 -281 433
          -371 631 -110 244 -176 468 -219 750 -47 303 -99 484 -200 696 -123 259 -281
          454 -488 607 -265 195 -554 292 -970 326 -148 12 -508 11 -617 -1z m740 -244
          c378 -51 656 -184 874 -416 215 -229 363 -559 421 -944 57 -371 130 -621 267
          -915 77 -164 159 -305 338 -575 229 -346 284 -435 274 -444 -5 -5 -42 -16 -82
          -26 -126 -30 -186 -18 -425 87 -76 33 -140 58 -144 55 -3 -3 -18 -64 -34 -134
          -114 -508 -351 -882 -764 -1205 -52 -40 -94 -75 -94 -78 0 -3 108 -70 241
          -150 133 -80 250 -157 261 -171 17 -24 17 -29 4 -62 -9 -19 -24 -40 -35 -46
          -28 -15 -1052 -15 -1121 0 -100 21 -138 68 -177 214 l-21 80 -169 3 -169 2
          -18 -67 c-38 -148 -87 -211 -177 -232 -52 -12 -1109 -15 -1126 -3 -42 29 -57
          98 -26 124 9 8 118 77 242 153 124 75 231 143 238 149 10 10 -10 30 -95 98
          -408 324 -647 711 -759 1231 -15 70 -31 127 -36 127 -4 0 -45 -25 -92 -55
          -116 -76 -197 -112 -284 -127 -63 -11 -85 -10 -154 4 -45 10 -86 22 -91 27
          -14 14 41 107 245 414 220 331 289 449 374 641 122 276 203 561 269 936 70
          398 192 664 407 886 222 230 529 376 898 430 126 18 578 12 740 -11z"/>
          <path fill="3273dc" d="M3417 4856 c-134 -48 -188 -209 -111 -333 61 -100 191 -132 303 -77
          90 45 133 141 111 249 -10 46 -21 66 -58 105 -66 68 -155 88 -245 56z m151
          -106 c70 -43 78 -136 17 -197 -29 -29 -40 -33 -84 -33 -44 0 -56 5 -87 33
          -113 103 23 277 154 197z"/>
          <path d="M2435 4821 c-99 -25 -151 -115 -131 -225 13 -69 97 -135 174 -136 66
          0 138 44 169 105 19 36 21 122 3 155 -41 80 -131 122 -215 101z"/>
          <path fill="3273dc" d="M2928 4263 c-39 -6 -128 -64 -324 -208 -169 -125 -176 -131 -171
          -160 3 -16 10 -42 16 -58 9 -24 14 -26 38 -20 53 15 92 8 127 -23 143 -122
          178 -148 231 -174 150 -73 282 -39 453 116 81 74 118 94 171 94 34 0 44 5 67
          36 20 25 25 40 18 50 -13 20 -378 287 -435 319 -47 25 -134 38 -191 28z m183
          -143 c60 -41 244 -174 262 -190 5 -4 -11 -19 -35 -33 -24 -14 -77 -56 -118
          -93 -83 -74 -176 -124 -231 -124 -54 0 -147 52 -240 134 -46 40 -99 81 -118
          91 l-35 17 29 22 c114 84 275 198 300 211 51 26 112 15 186 -35z"/>
          <path fill="3273dc" d="M2838 2985 c-456 -87 -780 -515 -779 -1030 0 -297 95 -550 282 -750
          307 -328 765 -387 1128 -144 310 207 480 582 450 991 -33 441 -326 818 -715
          918 -104 28 -266 34 -366 15z m317 -211 c96 -25 208 -89 291 -167 117 -109
          190 -229 241 -394 25 -81 27 -102 27 -258 0 -156 -2 -177 -27 -258 -51 -165
          -124 -285 -241 -394 -134 -125 -283 -186 -456 -186 -173 0 -322 61 -456 186
          -117 109 -190 229 -241 394 -25 81 -27 102 -27 258 0 156 2 177 27 258 98 319
          329 534 622 580 47 8 174 -3 240 -19z"/>
          </g>
        </svg>
      </div>

      <% end %>

      <div class="packages">
        <ul>
        <%= for package <- @packages do %>
          <li>
            <div class="name"><%= package.name %></div>
            <div class="info"><a href="<%= package.info %>" >Info</a></div>
            <div class="man"><a href="<%= package.man %>" >Manual</a></div>
          </li>
        <% end %>
        </ul>
      </div>
    </div>
    """
  end

  def handle_event("deb-search", %{"name" => name}, socket) do
    send(self(), {:run_name_search, name})

    socket =
      assign(socket,
        name: name,
        packages: [],
        loading: true
      )

      {:noreply, socket}
  end

  def handle_info({:run_name_search, name}, socket) do
    case Packages.search_by_name(name) do
      [] ->
        socket =
          socket
          |> put_flash(:info, "No packages matching #{name}")
          |> assign(packages: [], loading: false)
          {:noreply, socket}

      packages ->
          socket = assign(socket, packages: packages, loading: false)
          {:noreply, socket}
      end
  end

end
