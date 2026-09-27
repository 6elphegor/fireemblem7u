	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyAutoWaterShadows
ApplyAutoWaterShadows: @ 0x08018EEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #0
	ldr r1, _08018FC4 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	mov sb, r1
	cmp r6, r0
	blt _08018F06
	b _08019032
_08018F06:
	ldr r0, _08018FC8 @ =0x08B932B4
	mov sl, r0
_08018F0A:
	movs r4, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r1, r6, #1
	mov r8, r1
	cmp r4, r0
	blt _08018F1A
	b _08019024
_08018F1A:
	ldr r2, _08018FCC @ =0x0202E3E0
	mov ip, r2
	lsls r3, r6, #2
	mov r7, sl
	movs r5, #0
_08018F24:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r2, [r0]
	cmp r2, #0x3c
	bne _08019014
	movs r2, #0
	cmp r4, #0
	ble _08018F56
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _08018F44
	movs r2, #1
_08018F44:
	cmp r0, #0x2d
	bne _08018F4A
	movs r2, #1
_08018F4A:
	cmp r0, #0x20
	bne _08018F50
	movs r2, #1
_08018F50:
	cmp r0, #0x21
	bne _08018F56
	movs r2, #1
_08018F56:
	cmp r6, #0
	ble _08018F80
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _08018F6E
	adds r2, #2
_08018F6E:
	cmp r0, #0x2d
	bne _08018F74
	adds r2, #2
_08018F74:
	cmp r0, #0x20
	bne _08018F7A
	adds r2, #2
_08018F7A:
	cmp r0, #0x21
	bne _08018F80
	adds r2, #2
_08018F80:
	cmp r4, #0
	ble _08018FB4
	cmp r6, #0
	ble _08018FB4
	mov r1, ip
	ldr r0, [r1]
	adds r1, r3, r0
	ldr r0, [r1]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _08018FB4
	ldr r0, [r1, #4]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _08018FB4
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _08018FB4
	movs r2, #4
_08018FB4:
	cmp r2, #2
	beq _08018FE8
	cmp r2, #2
	bgt _08018FD0
	cmp r2, #1
	beq _08018FDA
	b _08019014
	.align 2, 0
_08018FC4: .4byte 0x0202E3D8
_08018FC8: .4byte 0x08B932B4
_08018FCC: .4byte 0x0202E3E0
_08018FD0:
	cmp r2, #3
	beq _08018FF6
	cmp r2, #4
	beq _08019004
	b _08019014
_08018FDA:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xb7
	lsls r2, r2, #2
	b _08019010
_08018FE8:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xb6
	lsls r2, r2, #2
	b _08019010
_08018FF6:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xd6
	lsls r2, r2, #2
	b _08019010
_08019004:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xd7
	lsls r2, r2, #2
_08019010:
	adds r1, r2, #0
	strh r1, [r0]
_08019014:
	adds r5, #2
	adds r4, #1
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _08019024
	b _08018F24
_08019024:
	mov r6, r8
	mov r1, sb
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r6, r0
	bge _08019032
	b _08018F0A
_08019032:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
