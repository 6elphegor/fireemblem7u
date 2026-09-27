	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrNamewinAppear
NewEkrNamewinAppear: @ 0x08051B80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08051BB0 @ =0x08B9B254
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	subs r1, #0x31
	str r1, [r0, #0x48]
	cmp r4, #0
	bne _08051BB4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl EkrDispUP_SetPositionUnsync
	b _08051BBC
	.align 2, 0
_08051BB0: .4byte 0x08B9B254
_08051BB4:
	movs r0, #0
	movs r1, #0
	bl EkrDispUP_SetPositionUnsync
_08051BBC:
	ldr r1, _08051BCC @ =0x0201FAC4
	movs r0, #1
	str r0, [r1]
	bl UnsyncEkrDispUP
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051BCC: .4byte 0x0201FAC4
