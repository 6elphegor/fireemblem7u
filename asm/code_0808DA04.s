	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPrepMainMenuInfoxMsg
GetPrepMainMenuInfoxMsg: @ 0x0808DA04
	push {r4, lr}
	bl GetActivePrepMenuItemIndex
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808DA28
	ldr r0, _0808DA24 @ =0x08CC3B30
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #8
	b _0808DA60
	.align 2, 0
_0808DA24: .4byte 0x08CC3B30
_0808DA28:
	ldr r0, _0808DA38 @ =0x0202BBF8
	ldrb r1, [r0, #0xe]
	cmp r1, #0x2e
	bne _0808DA40
	cmp r4, #7
	bne _0808DA40
	ldr r0, _0808DA3C @ =0x000003EF
	b _0808DA64
	.align 2, 0
_0808DA38: .4byte 0x0202BBF8
_0808DA3C: .4byte 0x000003EF
_0808DA40:
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	beq _0808DA58
	ldr r0, _0808DA54 @ =0x08CC3B30
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #4
	b _0808DA60
	.align 2, 0
_0808DA54: .4byte 0x08CC3B30
_0808DA58:
	ldr r0, _0808DA6C @ =0x08CC3B30
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
_0808DA60:
	adds r1, r1, r0
	ldr r0, [r1]
_0808DA64:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808DA6C: .4byte 0x08CC3B30
