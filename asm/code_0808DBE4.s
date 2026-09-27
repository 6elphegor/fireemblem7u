	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepScreenMenu_OnSave
PrepScreenMenu_OnSave: @ 0x0808DBE4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808DC10 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808DBFA
	ldr r0, _0808DC14 @ =0x0000038A
	bl m4aSongNumStart
_0808DBFA:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DC10: .4byte 0x0202BBF8
_0808DC14: .4byte 0x0000038A
