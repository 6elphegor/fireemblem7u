	.include "macro.inc"

	.syntax unified

	thumb_func_start XMapTransfer_8048418
XMapTransfer_8048418: @ 0x08042DB0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _08042DC8
	ldr r1, _08042DC4 @ =0x0203DC98
	movs r0, #0
	b _08042DCC
	.align 2, 0
_08042DC4: .4byte 0x0203DC98
_08042DC8:
	ldr r1, _08042DF4 @ =0x0203DC98
	movs r0, #1
_08042DCC:
	str r0, [r1]
	adds r4, r1, #0
	mov r0, sp
	ldr r1, [r4]
	strb r1, [r0]
	movs r1, #4
	bl SioEmitData
	ldr r0, [r4]
	cmp r0, #0
	beq _08042DEA
	adds r0, r5, #0
	movs r1, #5
	bl EventGotoLabel
_08042DEA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042DF4: .4byte 0x0203DC98
