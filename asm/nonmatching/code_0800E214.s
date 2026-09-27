	.include "macro.inc"

	.syntax unified

	thumb_func_start EventSetUnitAi
EventSetUnitAi: @ 0x0800E214
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r1, #0x14
	beq _0800E230
	mov r3, ip
	adds r3, #0x42
	movs r0, #0
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x43
	strb r0, [r1]
_0800E230:
	cmp r2, #0x23
	beq _0800E250
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	cmp r2, #0xc
	bne _0800E250
	movs r0, #8
	mov r1, ip
	ldrb r1, [r1, #0xa]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0xa]
_0800E250:
	bx lr
	.align 2, 0
