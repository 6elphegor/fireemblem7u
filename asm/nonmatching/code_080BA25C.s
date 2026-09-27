	.include "macro.inc"

	.syntax unified

	thumb_func_start EndingCgScroll2_Init
EndingCgScroll2_Init: @ 0x080BA25C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080BA2FC @ =0x08CEEE68
	str r0, [r5, #0x30]
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080BA300 @ =0x085E0280
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0x80
	bl SetBgOffset
	ldr r0, _080BA304 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r4, #0
	ldr r6, _080BA308 @ =0x06008000
_080BA28E:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080BA2AC
	adds r2, r5, #0
	adds r2, #0x36
	ldrb r3, [r2]
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #0xb
	adds r1, r1, r6
	bl Decompress
_080BA2AC:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r6, r6, r0
	adds r4, #1
	cmp r4, #5
	ble _080BA28E
	movs r4, #1
_080BA2BA:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, #0x1c
	adds r0, r0, r1
	ldr r3, [r0]
	cmp r3, #0
	beq _080BA2E8
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r2, r1, #3
	subs r2, r2, r1
	lsls r2, r2, #0x16
	movs r0, #0xa0
	lsls r0, r0, #0x18
	adds r2, r2, r0
	lsrs r2, r2, #0x10
	lsls r0, r4, #9
	ldr r1, _080BA304 @ =0x02024460
	adds r0, r0, r1
	adds r1, r3, #0
	bl TmApplyTsa_thm
_080BA2E8:
	adds r4, #1
	cmp r4, #3
	ble _080BA2BA
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA2FC: .4byte 0x08CEEE68
_080BA300: .4byte 0x085E0280
_080BA304: .4byte 0x02024460
_080BA308: .4byte 0x06008000
