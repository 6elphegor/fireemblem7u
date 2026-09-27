	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809F224
sub_0809F224: @ 0x0809F224
	push {r4, r5, r6, r7, lr}
	sub sp, #0x98
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	add r0, sp, #0x94
	movs r4, #0
	strh r4, [r0]
	ldr r2, _0809F25C @ =0x0100000C
	adds r1, r6, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x96
	strh r4, [r0]
	ldr r2, _0809F260 @ =0x0100004A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F264
	movs r0, #0
	b _0809F280
	.align 2, 0
_0809F25C: .4byte 0x0100000C
_0809F260: .4byte 0x0100004A
_0809F264:
	lsls r0, r5, #1
	adds r0, r0, r5
	adds r0, r7, r0
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r1, r6, #0
	mov r3, sp
	adds r0, r3, r2
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #1
_0809F280:
	add sp, #0x98
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
