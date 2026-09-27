	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08015FF4
sub_08015FF4: @ 0x08015FF4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #0
	beq _08016010
	ldr r0, _0801600C @ =0x08B92E70
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _08016018
	.align 2, 0
_0801600C: .4byte 0x08B92E70
_08016010:
	ldr r0, _08016038 @ =0x08B92E70
	movs r1, #3
	bl Proc_Start
_08016018:
	adds r3, r0, #0
	ldr r1, _0801603C @ =0x0202BBB8
	ldrh r0, [r1, #0xc]
	movs r2, #0
	strh r0, [r3, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r3, #0x32]
	lsls r0, r5, #4
	strh r0, [r3, #0x2c]
	lsls r0, r6, #4
	strh r0, [r3, #0x2e]
	strh r7, [r3, #0x3a]
	str r2, [r3, #0x3c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016038: .4byte 0x08B92E70
_0801603C: .4byte 0x0202BBB8
