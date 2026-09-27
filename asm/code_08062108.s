	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062108
sub_08062108: @ 0x08062108
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r6, r2, #0
	ldr r1, _08062148 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806214C @ =0x08BA4164
	movs r1, #4
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08062150 @ =0x02022860
	ldr r1, _08062154 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	strh r6, [r4, #0x2e]
	mov r0, r8
	strh r0, [r4, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062148: .4byte 0x0201774C
_0806214C: .4byte 0x08BA4164
_08062150: .4byte 0x02022860
_08062154: .4byte 0x020165C8
