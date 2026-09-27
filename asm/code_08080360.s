	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplayWeaponExp
DisplayWeaponExp: @ 0x08080360
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	adds r6, r1, #0
	mov sl, r2
	adds r1, r3, #0
	ldr r0, _08080414 @ =0x0200310C
	ldr r0, [r0, #0xc]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r5, [r0]
	lsls r4, r2, #5
	adds r0, r4, r6
	lsls r0, r0, #1
	ldr r2, _08080418 @ =0x0200323C
	mov r8, r2
	add r0, r8
	adds r1, #0x70
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	movs r7, #2
	cmp r5, #0xfa
	ble _0808039C
	movs r7, #4
_0808039C:
	adds r4, #4
	adds r4, r4, r6
	lsls r4, r4, #1
	add r4, r8
	adds r0, r5, #0
	bl GetWeaponLevelSpecialCharFromExp
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutSpecialChar
	add r2, sp, #0x10
	adds r0, r5, #0
	add r1, sp, #0xc
	bl GetWeaponExpProgressState
	mov r0, sb
	lsls r5, r0, #1
	add r5, sb
	lsls r5, r5, #1
	ldr r2, _0808041C @ =0x00000401
	adds r5, r5, r2
	mov r4, sl
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #2
	adds r4, r4, r6
	lsls r4, r4, #1
	ldr r0, _08080420 @ =0x02003C3C
	adds r4, r4, r0
	movs r6, #0xc0
	lsls r6, r6, #7
	movs r0, #0x22
	str r0, [sp]
	ldr r1, [sp, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, [sp, #0x10]
	subs r1, #1
	bl __divsi3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #5
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutDrawUiGauge
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080414: .4byte 0x0200310C
_08080418: .4byte 0x0200323C
_0808041C: .4byte 0x00000401
_08080420: .4byte 0x02003C3C
