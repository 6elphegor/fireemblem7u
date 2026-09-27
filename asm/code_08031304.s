	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseSeize
CanUnitUseSeize: @ 0x08031304
	push {r4, r5, r6, lr}
	ldr r0, _08031324 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08031372
	adds r0, r2, #0
	bl CanUnitSeize
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803132C
	b _08031372
	.align 2, 0
_08031324: .4byte 0x03004690
_08031328:
	movs r0, #1
	b _08031374
_0803132C:
	ldr r0, _0803137C @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08031372
_08031338:
	ldr r0, _0803137C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _0803136C
	lsls r6, r5, #0x18
_08031346:
	ldr r0, _08031380 @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08031366
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	asrs r1, r6, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0xf
	beq _08031328
_08031366:
	subs r4, #1
	cmp r4, #0
	bge _08031346
_0803136C:
	subs r5, #1
	cmp r5, #0
	bge _08031338
_08031372:
	movs r0, #0
_08031374:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803137C: .4byte 0x0202E3D8
_08031380: .4byte 0x0202E3E4
