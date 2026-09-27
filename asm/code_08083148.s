	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08083148
sub_08083148: @ 0x08083148
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_08082E60
	ldr r0, _0808317C @ =0x08CC2A34
	adds r1, r6, #0
	bl Proc_StartBlocking
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808317C: .4byte 0x08CC2A34
