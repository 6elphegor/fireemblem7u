	.include "macro.inc"

	.syntax unified

	thumb_func_start InitBattleForecastIconPaletteBuffer
InitBattleForecastIconPaletteBuffer: @ 0x08033388
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	movs r1, #3
	bl ApplyIconPalette
	movs r1, #1
	ldr r0, _08033408 @ =0x02022860
	mov sb, r0
	movs r2, #0x1f
	mov ip, r2
	ldr r0, _0803340C @ =0x0200300C
	mov r8, r0
_080333A6:
	adds r0, r1, #0
	adds r0, #0x30
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	adds r4, r0, #0
	mov r2, ip
	ands r4, r2
	asrs r3, r0, #5
	ands r3, r2
	asrs r2, r0, #0xa
	mov r0, ip
	ands r2, r0
	lsls r0, r1, #1
	adds r7, r1, #1
	mov r1, r8
	adds r5, r0, r1
	movs r6, #7
_080333CA:
	lsls r0, r2, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r4
	strh r0, [r5]
	adds r4, #3
	cmp r4, #0x1f
	ble _080333DC
	movs r4, #0x1f
_080333DC:
	adds r3, #3
	cmp r3, #0x1f
	ble _080333E4
	movs r3, #0x1f
_080333E4:
	adds r2, #3
	cmp r2, #0x1f
	ble _080333EC
	movs r2, #0x1f
_080333EC:
	adds r5, #0x20
	subs r6, #1
	cmp r6, #0
	bge _080333CA
	adds r1, r7, #0
	cmp r1, #0xf
	ble _080333A6
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033408: .4byte 0x02022860
_0803340C: .4byte 0x0200300C
