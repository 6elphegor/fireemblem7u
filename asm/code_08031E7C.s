	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshUnitHpStatusInfoWindow
RefreshUnitHpStatusInfoWindow: @ 0x08031E7C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x38
	adds r0, r6, #0
	mov r1, r8
	bl DrawUnitHpText
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r0, _08031EEC @ =0x02022C60
	mov sb, r0
	add r1, sb
	adds r0, r6, #0
	bl PutText
	adds r5, #0x40
	adds r0, r5, #0
	mov r1, r8
	bl DrawUnitStatusText
	adds r4, #0xa1
	lsls r4, r4, #1
	add r4, sb
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
_08031EEC: .4byte 0x02022C60
