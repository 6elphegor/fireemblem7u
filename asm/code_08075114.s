	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08075114
sub_08075114: @ 0x08075114
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075134 @ =0x02022920
	ldr r1, _08075138 @ =0x03004990
	movs r2, #0x50
	bl CpuFastSet
	movs r0, #0
	str r0, [r7, #4]
_0807512A:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _0807513C
	b _08075160
	.align 2, 0
_08075134: .4byte 0x02022920
_08075138: .4byte 0x03004990
_0807513C:
	ldr r0, _0807515C @ =0x08B92A28
	ldr r2, [r7, #4]
	adds r1, r2, #6
	movs r2, #0x3c
	ldr r3, [r7]
	bl StartPalFade
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0xf
	bl SetPalFadeStop
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0807512A
	.align 2, 0
_0807515C: .4byte 0x08B92A28
_08075160:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
