	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonBg2ScrollHandler_Loop
EkrDragonBg2ScrollHandler_Loop: @ 0x08065BA8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08065BEC @ =0x0201FB20
	ldr r0, [r0]
	ldr r3, _08065BF0 @ =0x0201FB2C
	cmp r0, #0
	bne _08065BB8
	ldr r3, _08065BF4 @ =0x0201FC6C
_08065BB8:
	movs r2, #0
	ldr r6, _08065BF8 @ =0x080C5A48
	movs r5, #0xff
_08065BBE:
	lsls r0, r2, #1
	movs r7, #0x2c
	ldrsh r1, [r4, r7]
	adds r0, r0, r1
	ands r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #0xa
	adds r0, #4
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _08065BBE
	ldrh r0, [r4, #0x2c]
	adds r0, #2
	strh r0, [r4, #0x2c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065BEC: .4byte 0x0201FB20
_08065BF0: .4byte 0x0201FB2C
_08065BF4: .4byte 0x0201FC6C
_08065BF8: .4byte 0x080C5A48
