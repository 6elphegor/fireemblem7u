	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonTmCpyExt
EkrDragonTmCpyExt: @ 0x08064B38
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r1, #0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08064B86
	asrs r4, r7, #3
	movs r1, #7
	asrs r5, r6, #3
	ands r6, r1
	movs r0, #3
	ands r1, r7
	adds r2, r6, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, _08064B90 @ =0x0201D45E
	adds r4, r4, r0
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r2, _08064B94 @ =0x02024460
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x21
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #8
	bl EnableBgSync
_08064B86:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064B90: .4byte 0x0201D45E
_08064B94: .4byte 0x02024460
