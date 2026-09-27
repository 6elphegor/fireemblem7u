	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805A928
sub_0805A928: @ 0x0805A928
	push {r4, r5, r6, r7, lr}
	sub sp, #0x90
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0805A994 @ =0x081E88CA
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	add r4, sp, #0x10
	ldr r1, _0805A998 @ =0x081E88DA
	adds r0, r4, #0
	movs r2, #0x80
	bl memcpy
	ldr r1, _0805A99C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A9A0 @ =0x08BA2918
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	str r5, [r7, #0x5c]
	movs r5, #0
	strh r5, [r7, #0x2c]
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r7, #0x2e]
	movs r0, #0xe0
	bl sub_080672E8
	adds r0, #8
	strh r0, [r7, #0x32]
	strh r5, [r7, #0x3a]
	movs r1, #0
	movs r0, #0x3f
	ands r0, r6
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #5
	bhi _0805A9F4
	lsls r0, r0, #2
	ldr r1, _0805A9A4 @ =_0805A9A8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A994: .4byte 0x081E88CA
_0805A998: .4byte 0x081E88DA
_0805A99C: .4byte 0x0201774C
_0805A9A0: .4byte 0x08BA2918
_0805A9A4: .4byte _0805A9A8
_0805A9A8: @ jump table
	.4byte _0805A9C0 @ case 0
	.4byte _0805A9C8 @ case 1
	.4byte _0805A9D0 @ case 2
	.4byte _0805A9D8 @ case 3
	.4byte _0805A9E0 @ case 4
	.4byte _0805A9E8 @ case 5
_0805A9C0:
	ldr r0, _0805A9C4 @ =0x08BD2478
	b _0805A9EA
	.align 2, 0
_0805A9C4: .4byte 0x08BD2478
_0805A9C8:
	ldr r0, _0805A9CC @ =0x08BD2470
	b _0805A9EA
	.align 2, 0
_0805A9CC: .4byte 0x08BD2470
_0805A9D0:
	ldr r0, _0805A9D4 @ =0x08BD2468
	b _0805A9EA
	.align 2, 0
_0805A9D4: .4byte 0x08BD2468
_0805A9D8:
	ldr r0, _0805A9DC @ =0x08BD2460
	b _0805A9EA
	.align 2, 0
_0805A9DC: .4byte 0x08BD2460
_0805A9E0:
	ldr r0, _0805A9E4 @ =0x08BD2480
	b _0805A9EA
	.align 2, 0
_0805A9E4: .4byte 0x08BD2480
_0805A9E8:
	ldr r0, _0805AA08 @ =0x08BD2458
_0805A9EA:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r7, #0x60]
_0805A9F4:
	cmp r1, #0
	bne _0805AA10
	ldr r1, _0805AA0C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
	b _0805AA1E
	.align 2, 0
_0805AA08: .4byte 0x08BD2458
_0805AA0C: .4byte 0x0201774C
_0805AA10:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r7, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r7, #0x3a]
	strh r0, [r1, #4]
_0805AA1E:
	add sp, #0x90
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
