	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshUnitHpInfoWindow
RefreshUnitHpInfoWindow: @ 0x08031E10
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
	adds r0, r5, #0
	adds r1, r6, #0
	bl DrawUnitHpText
	adds r4, #0x61
	lsls r4, r4, #1
	ldr r0, _08031E58 @ =0x02022C60
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031E58: .4byte 0x02022C60
