import { useSession, useSupabaseClient } from "@supabase/auth-helpers-react";
import { Auth, ThemeSupa } from "@supabase/auth-ui-react";

export default function Auth({ children }: { children: React.ReactNode }) {
  const session = useSession();
  const supabase = useSupabaseClient();

  if (!session)
    return (
      <div className="w-full h-full bg-gray-200">
        <div className="min-w-full min-h-screen flex items-center justify-center">
          <div className="w-full h-full flex justify-center items-center p-4">
            <div className="w-full h-full sm:h-auto sm:w-2/5 max-w-sm p-5 bg-white shadow flex flex-col text-base">
              <span className="font-sans text-4xl text-center pb-2 mb-1 border-b mx-4 align-center">
                Login
              </span>
              <Auth
                supabaseClient={supabase}
                appearance={{ theme: ThemeSupa }}
                theme="dark"
              />
            </div>
          </div>
        </div>
      </div>
    );
  return <>{children}</>;
}
