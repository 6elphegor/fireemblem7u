	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803C294
sub_0803C294: @ 0x0803C294
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0803C3E4 @ =0x030046B4
	movs r3, #0
	str r3, [r0]
	ldr r2, _0803C3E8 @ =0x08B98AEC
	ldr r0, [r2]
	movs r1, #0
	strh r3, [r0, #0x22]
	strh r3, [r0, #0x24]
	ldr r4, _0803C3EC @ =0x00001B74
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x1e]
	ldr r0, [r2]
	strb r1, [r0, #0x1f]
	ldr r0, [r2]
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, [r2]
	strh r3, [r0, #0x30]
	ldr r0, _0803C3F0 @ =0x030013D8
	mov sb, r0
	ldr r1, _0803C3F4 @ =0x030013DA
	mov r8, r1
	adds r5, r2, #0
	movs r4, #0
_0803C2E8:
	ldr r0, [r5]
	adds r0, #0xb
	adds r0, r0, r3
	strb r4, [r0]
	ldr r1, [r5]
	lsls r2, r3, #1
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r2
	strh r4, [r0]
	adds r1, #0x1a
	adds r1, r1, r3
	strb r4, [r1]
	ldr r0, [r5]
	adds r0, #0x26
	adds r0, r0, r2
	strh r4, [r0]
	adds r3, #1
	cmp r3, #3
	ble _0803C2E8
	movs r3, #0
	ldr r5, _0803C3F8 @ =0x030047B0
	movs r2, #0
	ldr r4, _0803C3E8 @ =0x08B98AEC
_0803C318:
	adds r0, r3, r5
	strb r2, [r0]
	ldr r0, [r4]
	lsls r1, r3, #1
	adds r0, #0x32
	adds r0, r0, r1
	strh r2, [r0]
	adds r3, #1
	cmp r3, #0x7f
	ble _0803C318
	movs r4, #0
	ldr r5, _0803C3E8 @ =0x08B98AEC
	movs r1, #0
	movs r2, #0x9a
	lsls r2, r2, #1
_0803C336:
	ldr r0, [r5]
	adds r0, r0, r2
	strb r1, [r0]
	strb r1, [r0, #4]
	movs r3, #0x7f
	adds r0, #0x89
_0803C342:
	strb r1, [r0]
	subs r0, #1
	subs r3, #1
	cmp r3, #0
	bge _0803C342
	adds r2, #0x8c
	adds r4, #1
	cmp r4, #0x1f
	ble _0803C336
	movs r4, #0
	ldr r2, _0803C3E8 @ =0x08B98AEC
	mov ip, r2
	movs r5, #0
	movs r7, #0x8c
	ldr r6, _0803C3FC @ =0x000012B4
_0803C360:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r2, ip
	ldr r1, [r2]
	adds r1, r1, r0
	strb r5, [r1]
	strb r5, [r1, #4]
	adds r2, r4, #1
	movs r3, #0x7f
	adds r1, #0x89
_0803C376:
	strb r5, [r1]
	subs r1, #1
	subs r3, #1
	cmp r3, #0
	bge _0803C376
	adds r4, r2, #0
	cmp r4, #0xf
	ble _0803C360
	movs r0, #0
	mov r4, r8
	strh r0, [r4]
	mov r1, sb
	strh r0, [r1]
	movs r1, #0
	ldr r0, _0803C400 @ =0x0203C50C
	movs r3, #0x80
	lsls r3, r3, #2
_0803C398:
	strh r1, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bne _0803C398
	movs r4, #0
	ldr r2, _0803C404 @ =0x030013E0
	mov r8, r2
	movs r5, #0
	ldr r0, _0803C408 @ =0x000001FF
	mov ip, r0
	ldr r7, _0803C40C @ =0x0203C90C
	ldr r6, _0803C410 @ =0x030013E8
_0803C3B2:
	lsls r0, r4, #1
	mov r1, r8
	adds r2, r0, r1
	adds r1, r0, r6
	strh r5, [r1]
	strh r5, [r2]
	adds r2, r4, #1
	adds r0, r0, r7
	mov r3, ip
	adds r3, #1
_0803C3C6:
	strh r5, [r0]
	adds r0, #8
	subs r3, #1
	cmp r3, #0
	bne _0803C3C6
	adds r4, r2, #0
	cmp r4, #3
	ble _0803C3B2
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C3E4: .4byte 0x030046B4
_0803C3E8: .4byte 0x08B98AEC
_0803C3EC: .4byte 0x00001B74
_0803C3F0: .4byte 0x030013D8
_0803C3F4: .4byte 0x030013DA
_0803C3F8: .4byte 0x030047B0
_0803C3FC: .4byte 0x000012B4
_0803C400: .4byte 0x0203C50C
_0803C404: .4byte 0x030013E0
_0803C408: .4byte 0x000001FF
_0803C40C: .4byte 0x0203C90C
_0803C410: .4byte 0x030013E8
