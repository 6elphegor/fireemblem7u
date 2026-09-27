	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshUnitStaffOffenseInfoWindow
RefreshUnitStaffOffenseInfoWindow: @ 0x08031F7C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r6, r0, #0
	mov sb, r1
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r5, r0, #0
	movs r0, #0x38
	adds r0, r0, r5
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	movs r2, #7
	subs r2, r2, r0
	mov r0, r8
	adds r1, r6, #0
	bl DrawUnitResUnkText
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r6, _08031FF8 @ =0x02022C60
	adds r1, r1, r6
	mov r0, r8
	bl PutText
	adds r5, #0x40
	adds r0, r5, #0
	mov r1, sb
	bl DrawAccuracyText
	adds r4, #0xa1
	lsls r4, r4, #1
	adds r4, r4, r6
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031FF8: .4byte 0x02022C60
