	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096A98
sub_08096A98: @ 0x08096A98
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _08096AC0 @ =0x02012466
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _08096AC4
	mov r3, ip
	adds r3, #0x35
	ldrb r1, [r3]
	lsls r0, r1, #1
	mov r1, ip
	adds r1, #0x3a
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _08096AE2
	.align 2, 0
_08096AC0: .4byte 0x02012466
_08096AC4:
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r1, r0, #1
	mov r0, ip
	adds r0, #0x3a
	adds r0, r0, r1
	ldrh r4, [r5]
	subs r4, #1
	adds r3, r2, #0
	adds r2, #0x17
	ldrh r1, [r0]
	cmp r1, r4
	ble _08096AE2
	strh r4, [r0]
_08096AE2:
	ldrh r0, [r5]
	cmp r0, #6
	bls _08096B00
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r4, r2, r0
	ldrh r1, [r4]
	lsrs r0, r1, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _08096B00
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_08096B00:
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
