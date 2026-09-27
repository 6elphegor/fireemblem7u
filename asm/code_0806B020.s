	.include "macro.inc"

	.syntax unified

	thumb_func_start PutBanimBG
PutBanimBG: @ 0x0806B020
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl PutBanimBgIMG
	movs r5, #0
	str r5, [sp]
	ldr r1, _0806B05C @ =0x0600FFE0
	ldr r2, _0806B060 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	adds r0, r4, #0
	bl PutBanimBgTSA
	adds r0, r4, #0
	bl PutBanimBgPAL
	ldr r0, _0806B064 @ =0x02022860
	strh r5, [r0]
	movs r0, #8
	bl EnableBgSync
	bl EnablePalSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B05C: .4byte 0x0600FFE0
_0806B060: .4byte 0x01000008
_0806B064: .4byte 0x02022860
