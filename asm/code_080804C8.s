	.include "macro.inc"

	.syntax unified

	thumb_func_start PutStatScreenPage
PutStatScreenPage: @ 0x080804C8
	push {r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	mov r1, sp
	ldr r0, _08080508 @ =0x08404B60
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r5, #0
	str r5, [sp, #0x10]
	add r0, sp, #0x10
	ldr r1, _0808050C @ =0x0200323C
	ldr r2, _08080510 @ =0x01000140
	bl CpuFastSet
	str r5, [sp, #0x14]
	add r0, sp, #0x14
	ldr r1, _08080514 @ =0x02003C3C
	ldr r2, _08080518 @ =0x01000120
	bl CpuFastSet
	lsls r4, r4, #2
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	bl _call_via_r0
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080508: .4byte 0x08404B60
_0808050C: .4byte 0x0200323C
_08080510: .4byte 0x01000140
_08080514: .4byte 0x02003C3C
_08080518: .4byte 0x01000120
