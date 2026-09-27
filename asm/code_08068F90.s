	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrLevelup
NewEkrLevelup: @ 0x08068F90
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08068FBC @ =0x020200AC
	ldr r0, _08068FC0 @ =0x08BDB5FC
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r6, [r5]
	str r4, [r6, #0x5c]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x60]
	ldr r0, _08068FC4 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	beq _08068FC8
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #0
	b _08068FCE
	.align 2, 0
_08068FBC: .4byte 0x020200AC
_08068FC0: .4byte 0x08BDB5FC
_08068FC4: .4byte 0x0203E02C
_08068FC8:
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #1
_08068FCE:
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	strh r1, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x29
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
