	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096BB0
sub_08096BB0: @ 0x08096BB0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl InitIcons
	ldr r0, _08096C48 @ =0x02023C7E
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r1, r0, #4
	mov r0, r8
	bl sub_08095DC0
	ldr r0, _08096C4C @ =0x02022EA4
	ldr r1, [r4, #0x2c]
	bl DrawPrepScreenItemIcons
	movs r0, #5
	bl EnableBgSync
	cmp r7, #0
	bge _08096C02
	ldr r0, _08096C50 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_08095E24
_08096C02:
	cmp r7, #0
	ble _08096C1C
	ldr r0, _08096C50 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_08095E24
_08096C1C:
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	adds r1, r2, r7
	strh r1, [r0]
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096C48: .4byte 0x02023C7E
_08096C4C: .4byte 0x02022EA4
_08096C50: .4byte 0x02012BA0
