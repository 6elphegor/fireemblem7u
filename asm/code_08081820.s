	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBox_OnOpen
HelpBox_OnOpen: @ 0x08081820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808185C @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _08081836
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #1
	strb r0, [r1]
_08081836:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0
	bne _08081854
	ldr r0, _08081860 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08081854
	movs r0, #0xe4
	lsls r0, r0, #2
	bl m4aSongNumStart
_08081854:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808185C: .4byte 0x08CC209C
_08081860: .4byte 0x0202BBF8
