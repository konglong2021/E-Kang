<x-guest-layout>
    <x-jet-authentication-card>
        <x-slot name="logo">
            {{-- <x-jet-authentication-card-logo /> --}}
            <h1>Product</h1>
        </x-slot>

        <x-jet-validation-errors class="mb-4" />

        <form method="POST" action="{{ route('product.store') }}">
            @csrf

            <div>
                <x-jet-label for="en_name" value="{{ __('English Name') }}" />
                <x-jet-input id="en_name" class="block mt-1 w-full" type="text" name="en_name" :value="old('en_name')" required autofocus autocomplete="en_name" />
            </div>
            <div>
                <x-jet-label for="kh_name" value="{{ __('ឈ្មោះខ្មែរ') }}" />
                <x-jet-input id="kh_name" class="block mt-1 w-full" type="text" name="kh_name" :value="old('kh_name')" required autofocus autocomplete="kh_name" />
            </div>

            <div class="mt-4">
                <x-jet-label for="code" value="{{ __('Code') }}" />
                <x-jet-input id="code" class="block mt-1 w-full" type="text" name="code" :value="old('code')" required />
            </div>
            <div class="mt-4">
                <x-jet-label for="categorie_id" value="{{ __('Category') }}" />
                <x-jet-input id="categorie_id" class="block mt-1 w-full" type="number" name="categorie_id" :value="old('categorie_id')" required />
            </div>

            <div class="mt-4">
                <x-jet-label for="image" value="{{ __('Image') }}" />
                <x-jet-input id="image" class="block mt-1 w-full" type="text" name="image" required autocomplete="image" />
            </div>

            <div class="mt-4">
                <label class="font-semibold text-gray-600 py-2">Description</label>
                <textarea required="" name="description" id="description" class="w-full min-h-[100px] max-h-[300px] h-28 appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg  py-4 px-4" placeholder="Enter your comapny info" spellcheck="false"></textarea>
              
            </div>

            


            <div class="flex items-center justify-end mt-4">
            
                <x-jet-button class="ml-4">
                    {{ __('Register') }}
                </x-jet-button>
            </div>
        </form>
    </x-jet-authentication-card>
</x-guest-layout>
