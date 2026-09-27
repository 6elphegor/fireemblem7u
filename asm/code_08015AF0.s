	.include "macro.inc"

	.syntax unified

	thumb_func_start CamMove_Init
CamMove_Init: @ 0x08015AF0
	push {r4, r5, r6, lr}
	mov ip, r0
	movs r5, #1
	movs r1, #0x2c
	ldrsh r2, [r0, r1]
	movs r3, #0x30
	ldrsh r0, [r0, r3]
	subs r1, r2, r0
	cmp r1, #0
	bge _08015B06
	subs r1, r0, r2
_08015B06:
	mov r4, ip
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r2, r3, r0
	cmp r2, #0
	bge _08015B18
	subs r2, r0, r3
_08015B18:
	cmp r1, r2
	ble _08015B28
	mov r0, ip
	adds r0, #0x40
	strb r5, [r0]
	mov r3, ip
	strh r1, [r3, #0x38]
	b _08015B34
_08015B28:
	mov r1, ip
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	mov r4, ip
	strh r2, [r4, #0x38]
_08015B34:
	mov r0, ip
	movs r1, #0x38
	ldrsh r3, [r0, r1]
	movs r4, #0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	ldr r6, _08015B4C @ =0x0202BC48
	cmp r0, #0
	bge _08015B50
	strb r3, [r6]
	b _08015B76
	.align 2, 0
_08015B4C: .4byte 0x0202BC48
_08015B50:
	lsls r1, r5, #0x18
	asrs r2, r1, #0x18
	asrs r1, r1, #0x19
	subs r3, r3, r1
	adds r0, r4, r6
	strb r1, [r0]
	cmp r2, #0xf
	bgt _08015B66
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08015B66:
	adds r4, #1
	lsls r0, r5, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	cmp r0, #0
	bge _08015B50
	adds r0, r4, r6
	strb r3, [r0]
_08015B76:
	mov r2, ip
	str r4, [r2, #0x3c]
	ldrh r0, [r2, #0x38]
	strh r0, [r2, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
