	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08090F9C
sub_08090F9C: @ 0x08090F9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, _08091054 @ =0x02011E24
	mov r8, r0
	ldr r0, _08091058 @ =0x02012466
	movs r1, #0
	strh r1, [r0]
	movs r4, #0
	ldr r1, _0809105C @ =0x02012464
	mov sl, r0
	adds r2, r1, #0
	ldrh r1, [r2]
	cmp r4, r1
	bge _08091008
	ldr r1, _08091060 @ =0x08CC440C
	mov r3, sb
	lsls r0, r3, #2
	adds r6, r0, r1
	mov r7, sl
_08090FCC:
	ldr r1, _08091064 @ =0x020117E4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	str r2, [sp]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldrb r1, [r6]
	cmp r0, r1
	blo _08090FFE
	ldrb r3, [r6, #1]
	cmp r0, r3
	bhi _08090FFE
	ldr r0, [r5]
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_08090FFE:
	adds r4, #1
	ldr r0, _0809105C @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blt _08090FCC
_08091008:
	movs r4, #0
	ldrh r2, [r2]
	cmp r4, r2
	bge _0809104A
	ldr r1, _08091060 @ =0x08CC440C
	mov r2, sb
	lsls r0, r2, #2
	adds r6, r0, r1
_08091018:
	ldr r1, _08091064 @ =0x020117E4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r6]
	cmp r0, r3
	blo _08091034
	ldrb r1, [r6, #1]
	cmp r0, r1
	bls _08091040
_08091034:
	ldr r0, [r5]
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
_08091040:
	adds r4, #1
	ldr r0, _0809105C @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blt _08091018
_0809104A:
	movs r2, #1
	ldr r5, _08091054 @ =0x02011E24
	ldr r3, _08091058 @ =0x02012466
	mov sl, r3
	b _0809106E
	.align 2, 0
_08091054: .4byte 0x02011E24
_08091058: .4byte 0x02012466
_0809105C: .4byte 0x02012464
_08091060: .4byte 0x08CC440C
_08091064: .4byte 0x020117E4
_08091068:
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r2, r0, #1
_0809106E:
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #3
	str r2, [sp]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r2, r0
	blt _08091068
	cmp r2, #0
	ble _08091110
_08091088:
	adds r4, r2, #0
	mov r3, sl
	ldrh r3, [r3]
	cmp r2, r3
	bge _08091102
	ldr r0, _0809112C @ =0x02012466
	mov sl, r0
_08091096:
	subs r7, r4, r2
	adds r4, #1
	mov sb, r4
	cmp r7, #0
	blt _080910F6
	ldr r1, _08091130 @ =0x02011E24
	mov r8, r1
_080910A4:
	lsls r0, r7, #2
	mov r3, r8
	adds r6, r0, r3
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldr r2, [sp]
	adds r0, r7, r2
	lsls r0, r0, #2
	mov r1, r8
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bgt _080910E8
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bne _080910F6
	ldrh r3, [r6, #2]
	ldrh r0, [r5, #2]
	cmp r3, r0
	bls _080910F0
_080910E8:
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
_080910F0:
	subs r7, r7, r2
	cmp r7, #0
	bge _080910A4
_080910F6:
	mov r4, sb
	ldr r0, _0809112C @ =0x02012466
	ldr r5, _08091130 @ =0x02011E24
	ldrh r0, [r0]
	cmp r4, r0
	blt _08091096
_08091102:
	adds r0, r2, #0
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0
	bgt _08091088
_08091110:
	ldr r1, _08091134 @ =0x020117E4
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r0, r5, #0
	bl CpuFastSet
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809112C: .4byte 0x02012466
_08091130: .4byte 0x02011E24
_08091134: .4byte 0x020117E4
