export default function TokenPage({ params }: { params: { token: string } }) {
  return (
    <main style={{ padding: 24 }}>
      <h1>Card Entry</h1>
      <p>Token: {params.token}</p>
      <p>Implement registration/login/session per docs/BLUEPRINT.md.</p>
    </main>
  );
}
