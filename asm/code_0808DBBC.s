	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepScreenMenu_OnSupport
PrepScreenMenu_OnSupport: @ 0x0808DBBC
	push {lr}
	movs r1, #0xc
	bl Proc_Goto
	ldr r0, _0808DBDC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808DBD6
	ldr r0, _0808DBE0 @ =0x0000038A
	bl m4aSongNumStart
_0808DBD6:
	pop {r0}
	bx r0
	.align 2, 0
_0808DBDC: .4byte 0x0202BBF8
_0808DBE0: .4byte 0x0000038A
