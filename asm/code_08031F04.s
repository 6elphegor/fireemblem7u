	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshUnitResChangeInfoWindow
RefreshUnitResChangeInfoWindow: @ 0x08031F04
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r5, r0, #0
	adds r5, #0x38
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	movs r2, #7
	subs r2, r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl DrawUnitResChangeText
	adds r4, #0x61
	lsls r4, r4, #1
	ldr r0, _08031F58 @ =0x02022C60
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031F58: .4byte 0x02022C60
