	.include "macro.inc"

	.syntax unified

	thumb_func_start GetFurthestTargetDistance
GetFurthestTargetDistance: @ 0x0804B048
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r5, _0804B080 @ =0x0203DCF8
	ldr r0, _0804B084 @ =0x0203DFF8
	ldr r0, [r0]
	cmp r7, r0
	bge _0804B09E
	ldr r1, _0804B088 @ =0x0203DCF4
	mov ip, r1
	movs r2, #0
	ldrsh r6, [r1, r2]
	adds r4, r0, #0
_0804B060:
	movs r0, #0
	ldrsb r0, [r5, r0]
	subs r2, r6, r0
	cmp r2, #0
	bge _0804B06C
	subs r2, r0, r6
_0804B06C:
	mov r0, ip
	movs r1, #2
	ldrsh r3, [r0, r1]
	movs r0, #1
	ldrsb r0, [r5, r0]
	subs r1, r3, r0
	cmp r1, #0
	blt _0804B08C
	adds r0, r2, r1
	b _0804B090
	.align 2, 0
_0804B080: .4byte 0x0203DCF8
_0804B084: .4byte 0x0203DFF8
_0804B088: .4byte 0x0203DCF4
_0804B08C:
	subs r0, r0, r3
	adds r0, r2, r0
_0804B090:
	cmp r7, r0
	bge _0804B096
	adds r7, r0, #0
_0804B096:
	subs r4, #1
	adds r5, #0xc
	cmp r4, #0
	bne _0804B060
_0804B09E:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
