	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08085D48
sub_08085D48: @ 0x08085D48
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, _08085DBC @ =0x020039E4
	adds r0, r7, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _08085DC0 @ =0x02003564
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	adds r5, r4, #0
	adds r5, #0x44
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08085D8C
	ldr r1, _08085DC4 @ =0x0840493C
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r7, #0
	bl TmApplyTsa_thm
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
_08085D8C:
	ldrh r5, [r5]
	cmp r5, #1
	bne _08085DB6
	ldr r1, _08085DC8 @ =0x084048B4
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r7, #0
	bl TmApplyTsa_thm
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r6, #0
	adds r1, #0xc2
	bl PutText
_08085DB6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085DBC: .4byte 0x020039E4
_08085DC0: .4byte 0x02003564
_08085DC4: .4byte 0x0840493C
_08085DC8: .4byte 0x084048B4
