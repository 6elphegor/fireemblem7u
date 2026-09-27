	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateArrowTrapTargets
GenerateArrowTrapTargets: @ 0x0802BEC0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	movs r4, #0
	b _0802BEEA
_0802BECA:
	ldr r0, _0802BEFC @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802BEE8
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r6, #0
	bl EnlistTarget
_0802BEE8:
	adds r4, #1
_0802BEEA:
	ldr r0, _0802BF00 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r4, r0
	blt _0802BECA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802BEFC: .4byte 0x0202E3DC
_0802BF00: .4byte 0x0202E3D8
