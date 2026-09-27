	.include "macro.inc"

	.syntax unified

	thumb_func_start CanMoveActiveUnitTo
CanMoveActiveUnitTo: @ 0x0801CEF4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0801CF58 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r5, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CF52
	ldr r0, _0801CF5C @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0801CF52
	ldr r0, _0801CF60 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0801CF68
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTrapAt
	adds r2, r0, #0
	ldr r1, _0801CF64 @ =0x0202BD4C
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne _0801CF48
	movs r3, #2
	ldrsh r0, [r1, r3]
	cmp r5, r0
	beq _0801CF68
_0801CF48:
	cmp r2, #0
	beq _0801CF68
	ldrb r2, [r2, #2]
	cmp r2, #1
	bne _0801CF68
_0801CF52:
	movs r0, #0
	b _0801CF6A
	.align 2, 0
_0801CF58: .4byte 0x0202E3DC
_0801CF5C: .4byte 0x0202E3E4
_0801CF60: .4byte 0x03004690
_0801CF64: .4byte 0x0202BD4C
_0801CF68:
	movs r0, #1
_0801CF6A:
	pop {r4, r5}
	pop {r1}
	bx r1
